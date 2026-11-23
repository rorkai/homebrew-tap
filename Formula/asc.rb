# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '7.3.1'
  license 'MIT'

  depends_on macos: :ventura

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/7.3.1/asc_7.3.1_macOS_arm64'
      sha256 'af1527b33b4c65b78c3d9eef49ace9f815c3c33be604bf2cd95700a993dfec3f'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/7.3.1/asc_7.3.1_macOS_amd64'
      sha256 'ed9e078587eedd74e4458eee416b7139f72e0ac791ff3300d052d1520478a197'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_7.3.1_macOS_arm64' => 'asc'
    else
      bin.install 'asc_7.3.1_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
