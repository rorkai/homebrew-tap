# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '4.9.4'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/4.9.4/asc_4.9.4_macOS_arm64'
      sha256 'c0fed0518f8e42e5f8ee469882c153ecaa82d7a29743102dac278572c23f2693'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/4.9.4/asc_4.9.4_macOS_amd64'
      sha256 'f1556df28fcd249d385c15aa521c4e4fb972e46d13b9815bc98b1062a19f1ab8'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_4.9.4_macOS_arm64' => 'asc'
    else
      bin.install 'asc_4.9.4_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
