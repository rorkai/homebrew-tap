# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '4.5.0'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/4.5.0/asc_4.5.0_macOS_arm64'
      sha256 '9ea5822d513f365d3a70152ca7e6d3e608ae692077a8961b1ca05b730fe8673f'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/4.5.0/asc_4.5.0_macOS_amd64'
      sha256 '6cf95d81d3c328cc7faa151e3f0061a847750e90b61dc26a5600c319faf12e7e'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_4.5.0_macOS_arm64' => 'asc'
    else
      bin.install 'asc_4.5.0_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
